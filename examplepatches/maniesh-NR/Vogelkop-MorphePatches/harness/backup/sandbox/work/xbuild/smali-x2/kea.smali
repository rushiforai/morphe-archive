.class public final Lkea;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Laea;

.field public final c:Ljava/util/Set;

.field public final d:Ljava/util/List;


# direct methods
.method public constructor <init>(ZLaea;Ljava/util/Set;Ljava/util/List;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lkea;->a:Z

    iput-object p2, p0, Lkea;->b:Laea;

    iput-object p3, p0, Lkea;->c:Ljava/util/Set;

    iput-object p4, p0, Lkea;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2a

    instance-of v0, p1, Lkea;

    if-eqz v0, :cond_28

    check-cast p1, Lkea;

    iget-boolean v0, p0, Lkea;->a:Z

    iget-boolean v1, p1, Lkea;->a:Z

    if-ne v0, v1, :cond_28

    iget-object v0, p0, Lkea;->b:Laea;

    iget-object v1, p1, Lkea;->b:Laea;

    if-ne v0, v1, :cond_28

    iget-object v0, p0, Lkea;->c:Ljava/util/Set;

    iget-object v1, p1, Lkea;->c:Ljava/util/Set;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object p0, p0, Lkea;->d:Ljava/util/List;

    iget-object p1, p1, Lkea;->d:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a

    :cond_28
    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-boolean v0, p0, Lkea;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lkea;->b:Laea;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lkea;->c:Ljava/util/Set;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lkea;->d:Ljava/util/List;

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
