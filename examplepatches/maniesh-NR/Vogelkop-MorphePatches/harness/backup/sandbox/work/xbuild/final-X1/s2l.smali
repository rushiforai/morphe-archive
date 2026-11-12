.class public final Ls2l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lu3l;

.field public final b:Lb3c;

.field public final c:Z

.field public final d:Ljava/util/Set;

.field public final e:Lp6l;

.field public final f:Landroidx/recyclerview/widget/i;


# direct methods
.method public constructor <init>(Lu3l;Lb3c;ZLjava/util/Set;Lp6l;Landroidx/recyclerview/widget/i;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls2l;->a:Lu3l;

    iput-object p2, p0, Ls2l;->b:Lb3c;

    iput-boolean p3, p0, Ls2l;->c:Z

    iput-object p4, p0, Ls2l;->d:Ljava/util/Set;

    iput-object p5, p0, Ls2l;->e:Lp6l;

    iput-object p6, p0, Ls2l;->f:Landroidx/recyclerview/widget/i;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ls2l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ls2l;

    iget-object v1, p0, Ls2l;->a:Lu3l;

    iget-object v3, p1, Ls2l;->a:Lu3l;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ls2l;->b:Lb3c;

    iget-object v3, p1, Ls2l;->b:Lb3c;

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget-boolean v1, p0, Ls2l;->c:Z

    iget-boolean v3, p1, Ls2l;->c:Z

    if-eq v1, v3, :cond_25

    return v2

    :cond_25
    iget-object v1, p0, Ls2l;->d:Ljava/util/Set;

    iget-object v3, p1, Ls2l;->d:Ljava/util/Set;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_30

    return v2

    :cond_30
    iget-object v1, p0, Ls2l;->e:Lp6l;

    iget-object v3, p1, Ls2l;->e:Lp6l;

    if-eq v1, v3, :cond_37

    return v2

    :cond_37
    iget-object p0, p0, Ls2l;->f:Landroidx/recyclerview/widget/i;

    iget-object p1, p1, Ls2l;->f:Landroidx/recyclerview/widget/i;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_42

    return v2

    :cond_42
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ls2l;->a:Lu3l;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ls2l;->b:Lb3c;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Ls2l;->c:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Ls2l;->d:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ls2l;->e:Lp6l;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Ls2l;->f:Landroidx/recyclerview/widget/i;

    if-nez p0, :cond_2d

    const/4 p0, 0x0

    goto :goto_31

    :cond_2d
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_31
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
