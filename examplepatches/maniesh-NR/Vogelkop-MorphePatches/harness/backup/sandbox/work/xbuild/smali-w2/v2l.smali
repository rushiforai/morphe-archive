.class public final Lv2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm2l;


# instance fields
.field public final a:I

.field public final b:Z

.field public final c:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(IZ)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lv2l;->a:I

    iput-boolean p2, p0, Lv2l;->b:Z

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lv2l;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .registers 6

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    iget-object p0, p0, Lv2l;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_b
    :goto_b
    if-ge v2, v1, :cond_31

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lm2l;

    if-eqz v3, :cond_b

    instance-of v4, v3, Lu2l;

    if-eqz v4, :cond_23

    check-cast v3, Lu2l;

    iget-object v3, v3, Lu2l;->a:Lb2l;

    invoke-virtual {v0, v3}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_23
    instance-of v4, v3, Lv2l;

    if-eqz v4, :cond_b

    check-cast v3, Lv2l;

    invoke-virtual {v3}, Lv2l;->a()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0, v3}, Lehc;->addAll(Ljava/util/Collection;)Z

    goto :goto_b

    :cond_31
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lv2l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lv2l;

    iget v1, p0, Lv2l;->a:I

    iget v3, p1, Lv2l;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-boolean p0, p0, Lv2l;->b:Z

    iget-boolean p1, p1, Lv2l;->b:Z

    if-eq p0, p1, :cond_1a

    return v2

    :cond_1a
    return v0
.end method

.method public final getId()J
    .registers 2

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "not called"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Lv2l;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lv2l;->b:Z

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
