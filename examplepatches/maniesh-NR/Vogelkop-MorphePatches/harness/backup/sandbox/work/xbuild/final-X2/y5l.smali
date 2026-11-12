.class public final Ly5l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Leyj;

.field public final b:Lb3c;

.field public final c:Landroid/util/Size;


# direct methods
.method public constructor <init>(Leyj;Lb3c;Landroid/util/Size;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly5l;->a:Leyj;

    iput-object p2, p0, Ly5l;->b:Lb3c;

    iput-object p3, p0, Ly5l;->c:Landroid/util/Size;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ly5l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ly5l;

    iget-object v1, p0, Ly5l;->a:Leyj;

    iget-object v3, p1, Ly5l;->a:Leyj;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ly5l;->b:Lb3c;

    iget-object v3, p1, Ly5l;->b:Lb3c;

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget-object p0, p0, Ly5l;->c:Landroid/util/Size;

    iget-object p1, p1, Ly5l;->c:Landroid/util/Size;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    return v2

    :cond_29
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Ly5l;->a:Leyj;

    invoke-virtual {v0}, Leyj;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Ly5l;->b:Lb3c;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Ly5l;->c:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
