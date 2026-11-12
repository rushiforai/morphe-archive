.class public final Lfll;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Lf7j;

.field public final c:Ljava/util/List;

.field public final d:Lg7j;

.field public final e:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Lf7j;Ljava/util/List;Lg7j;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfll;->a:Ljava/util/List;

    iput-object p2, p0, Lfll;->b:Lf7j;

    iput-object p3, p0, Lfll;->c:Ljava/util/List;

    iput-object p4, p0, Lfll;->d:Lg7j;

    iput-boolean p5, p0, Lfll;->e:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lfll;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lfll;

    iget-object v1, p0, Lfll;->a:Ljava/util/List;

    iget-object v3, p1, Lfll;->a:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lfll;->b:Lf7j;

    iget-object v3, p1, Lfll;->b:Lf7j;

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lfll;->c:Ljava/util/List;

    iget-object v3, p1, Lfll;->c:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-object v1, p0, Lfll;->d:Lg7j;

    iget-object v3, p1, Lfll;->d:Lg7j;

    if-eq v1, v3, :cond_30

    return v2

    :cond_30
    iget-boolean p0, p0, Lfll;->e:Z

    iget-boolean p1, p1, Lfll;->e:Z

    if-eq p0, p1, :cond_37

    return v2

    :cond_37
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lfll;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lfll;->b:Lf7j;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lfll;->c:Ljava/util/List;

    invoke-static {v2, v1, v0}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object v2, p0, Lfll;->d:Lg7j;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean p0, p0, Lfll;->e:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
