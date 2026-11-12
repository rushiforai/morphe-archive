.class public final Lhv7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Leri;

.field public final c:Leri;

.field public final d:Ll42;

.field public final e:Leri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Ll42;->l:I

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Leri;Leri;Ll42;Leri;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhv7;->a:Ljava/util/List;

    iput-object p2, p0, Lhv7;->b:Leri;

    iput-object p3, p0, Lhv7;->c:Leri;

    iput-object p4, p0, Lhv7;->d:Ll42;

    iput-object p5, p0, Lhv7;->e:Leri;

    return-void
.end method

.method public static a(Lhv7;Ljava/util/List;Leri;Leri;Ll42;Leri;I)Lhv7;
    .registers 13

    and-int/lit8 v0, p6, 0x1

    if-eqz v0, :cond_6

    iget-object p1, p0, Lhv7;->a:Ljava/util/List;

    :cond_6
    move-object v1, p1

    and-int/lit8 p1, p6, 0x2

    if-eqz p1, :cond_d

    iget-object p2, p0, Lhv7;->b:Leri;

    :cond_d
    move-object v2, p2

    and-int/lit8 p1, p6, 0x4

    if-eqz p1, :cond_14

    iget-object p3, p0, Lhv7;->c:Leri;

    :cond_14
    move-object v3, p3

    and-int/lit8 p1, p6, 0x8

    if-eqz p1, :cond_1b

    iget-object p4, p0, Lhv7;->d:Ll42;

    :cond_1b
    move-object v4, p4

    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_22

    iget-object p5, p0, Lhv7;->e:Leri;

    :cond_22
    move-object v5, p5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lhv7;

    invoke-direct/range {v0 .. v5}, Lhv7;-><init>(Ljava/util/List;Leri;Leri;Ll42;Leri;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lhv7;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lhv7;

    iget-object v1, p0, Lhv7;->a:Ljava/util/List;

    iget-object v3, p1, Lhv7;->a:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lhv7;->b:Leri;

    iget-object v3, p1, Lhv7;->b:Leri;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lhv7;->c:Leri;

    iget-object v3, p1, Lhv7;->c:Leri;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Lhv7;->d:Ll42;

    iget-object v3, p1, Lhv7;->d:Ll42;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object p0, p0, Lhv7;->e:Leri;

    iget-object p1, p1, Lhv7;->e:Leri;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    return v2

    :cond_43
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lhv7;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lhv7;->b:Leri;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lhv7;->c:Leri;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Lhv7;->d:Ll42;

    if-nez v2, :cond_21

    move v2, v1

    goto :goto_25

    :cond_21
    invoke-virtual {v2}, Ll6e;->hashCode()I

    move-result v2

    :goto_25
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lhv7;->e:Leri;

    if-eqz p0, :cond_30

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_30
    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
