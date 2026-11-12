.class public final Lfz1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljx1;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Landroid/net/Uri;

.field public final d:Lez1;


# direct methods
.method public synthetic constructor <init>(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 12
    sget-object v0, Lez1;->c:Lez1;

    .line 13
    invoke-direct {p0, p2, p3, p1, v0}, Lfz1;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Lez1;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Lez1;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfz1;->a:Ljava/lang/String;

    iput-object p2, p0, Lfz1;->b:Ljava/lang/String;

    iput-object p3, p0, Lfz1;->c:Landroid/net/Uri;

    iput-object p4, p0, Lfz1;->d:Lez1;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lfz1;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lfz1;

    iget-object v1, p0, Lfz1;->a:Ljava/lang/String;

    iget-object v3, p1, Lfz1;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lfz1;->b:Ljava/lang/String;

    iget-object v3, p1, Lfz1;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lfz1;->c:Landroid/net/Uri;

    iget-object v3, p1, Lfz1;->c:Landroid/net/Uri;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object p0, p0, Lfz1;->d:Lez1;

    iget-object p1, p1, Lfz1;->d:Lez1;

    if-eq p0, p1, :cond_34

    return v2

    :cond_34
    return v0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lfz1;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lfz1;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lfz1;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lfz1;->c:Landroid/net/Uri;

    if-nez v2, :cond_15

    const/4 v2, 0x0

    goto :goto_19

    :cond_15
    invoke-virtual {v2}, Landroid/net/Uri;->hashCode()I

    move-result v2

    :goto_19
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lfz1;->d:Lez1;

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
