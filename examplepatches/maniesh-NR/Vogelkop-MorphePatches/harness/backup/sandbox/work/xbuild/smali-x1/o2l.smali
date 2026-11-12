.class public final Lo2l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/util/List;

.field public final c:Lz6l;

.field public final d:Lp6l;

.field public final e:Lzyk;

.field public final f:Lzyk;

.field public final g:Lzyk;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Lz6l;Lp6l;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo2l;->a:Ljava/util/List;

    iput-object p2, p0, Lo2l;->b:Ljava/util/List;

    iput-object p3, p0, Lo2l;->c:Lz6l;

    iput-object p4, p0, Lo2l;->d:Lp6l;

    new-instance p1, Ln2l;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Ln2l;-><init>(Lo2l;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lo2l;->e:Lzyk;

    new-instance p1, Ln2l;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Ln2l;-><init>(Lo2l;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lo2l;->f:Lzyk;

    new-instance p1, Ln2l;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Ln2l;-><init>(Lo2l;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lo2l;->g:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lb2l;)I
    .registers 6

    iget-object p0, p0, Lo2l;->a:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    if-ltz v0, :cond_2a

    check-cast v1, Lm2l;

    instance-of v3, v1, Lu2l;

    if-eqz v3, :cond_28

    check-cast v1, Lu2l;

    iget-object v1, v1, Lu2l;->a:Lb2l;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    return v0

    :cond_28
    move v0, v2

    goto :goto_9

    :cond_2a
    invoke-static {}, Lj95;->n()V

    const/4 p0, 0x0

    throw p0

    :cond_2f
    const/4 p0, -0x1

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lo2l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lo2l;

    iget-object v1, p0, Lo2l;->a:Ljava/util/List;

    iget-object v3, p1, Lo2l;->a:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lo2l;->b:Ljava/util/List;

    iget-object v3, p1, Lo2l;->b:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lo2l;->c:Lz6l;

    iget-object v3, p1, Lo2l;->c:Lz6l;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object p0, p0, Lo2l;->d:Lp6l;

    iget-object p1, p1, Lo2l;->d:Lp6l;

    if-eq p0, p1, :cond_34

    return v2

    :cond_34
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lo2l;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lo2l;->b:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object v2, p0, Lo2l;->c:Lz6l;

    iget-wide v2, v2, Lz6l;->a:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object p0, p0, Lo2l;->d:Lp6l;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
