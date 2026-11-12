.class public final Lxlk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lwlk;

.field public final b:Lwlk;

.field public final c:Lwlk;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Z


# direct methods
.method public constructor <init>(Lwlk;Lwlk;Lwlk;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxlk;->a:Lwlk;

    iput-object p2, p0, Lxlk;->b:Lwlk;

    iput-object p3, p0, Lxlk;->c:Lwlk;

    iput-object p4, p0, Lxlk;->d:Ljava/lang/String;

    iput-object p5, p0, Lxlk;->e:Ljava/lang/String;

    iput-boolean p6, p0, Lxlk;->f:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_4e

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    const-class v1, Lxlk;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    check-cast p1, Lxlk;

    iget-object v0, p0, Lxlk;->a:Lwlk;

    iget-object v1, p1, Lxlk;->a:Lwlk;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lxlk;->b:Lwlk;

    iget-object v1, p1, Lxlk;->b:Lwlk;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lxlk;->c:Lwlk;

    iget-object v1, p1, Lxlk;->c:Lwlk;

    invoke-virtual {v0, v1}, Lwlk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lxlk;->d:Ljava/lang/String;

    iget-object v1, p1, Lxlk;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lxlk;->e:Ljava/lang/String;

    iget-object v1, p1, Lxlk;->e:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-boolean p0, p0, Lxlk;->f:Z

    iget-boolean p1, p1, Lxlk;->f:Z

    if-eq p0, p1, :cond_4e

    :cond_4c
    const/4 p0, 0x0

    return p0

    :cond_4e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    const/4 v0, 0x0

    iget-object v1, p0, Lxlk;->a:Lwlk;

    if-eqz v1, :cond_a

    invoke-virtual {v1}, Lwlk;->hashCode()I

    move-result v1

    goto :goto_b

    :cond_a
    move v1, v0

    :goto_b
    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lxlk;->b:Lwlk;

    if-eqz v2, :cond_16

    invoke-virtual {v2}, Lwlk;->hashCode()I

    move-result v2

    goto :goto_17

    :cond_16
    move v2, v0

    :goto_17
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lxlk;->c:Lwlk;

    invoke-virtual {v2}, Lwlk;->hashCode()I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Lxlk;->d:Ljava/lang/String;

    if-eqz v1, :cond_2c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_2d

    :cond_2c
    move v1, v0

    :goto_2d
    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Lxlk;->e:Ljava/lang/String;

    if-eqz v1, :cond_38

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    :cond_38
    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x1f

    iget-boolean p0, p0, Lxlk;->f:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method
