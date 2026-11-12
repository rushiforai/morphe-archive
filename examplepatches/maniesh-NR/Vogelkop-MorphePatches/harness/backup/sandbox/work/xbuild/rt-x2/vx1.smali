.class public abstract Lvx1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljx1;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lwxe;

.field public final c:Lux1;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lwxe;Lux1;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvx1;->a:Ljava/lang/String;

    iput-object p2, p0, Lvx1;->b:Lwxe;

    iput-object p3, p0, Lvx1;->c:Lux1;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lvx1;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lvx1;

    iget-object v1, p1, Lvx1;->a:Ljava/lang/String;

    iget-object v3, p0, Lvx1;->a:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lvx1;->b:Lwxe;

    iget-object v3, p1, Lvx1;->b:Lwxe;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object p0, p0, Lvx1;->c:Lux1;

    iget-object p1, p1, Lvx1;->c:Lux1;

    if-eq p0, p1, :cond_29

    return v2

    :cond_29
    return v0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lvx1;->a:Ljava/lang/String;

    return-object p0
.end method

.method public hashCode()I
    .registers 3

    iget-object v0, p0, Lvx1;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lvx1;->b:Lwxe;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lvx1;->c:Lux1;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method
