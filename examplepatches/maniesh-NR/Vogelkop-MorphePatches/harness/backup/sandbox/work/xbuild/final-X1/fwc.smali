.class public final Lfwc;
.super Lewc;
.source "SourceFile"


# instance fields
.field public final d:Late;

.field public final e:Luse;

.field public final f:Lvse;


# direct methods
.method public constructor <init>(Late;Luse;Lvse;)V
    .registers 4

    invoke-direct {p0, p1}, Lewc;-><init>(Late;)V

    iput-object p1, p0, Lfwc;->d:Late;

    iput-object p2, p0, Lfwc;->e:Luse;

    iput-object p3, p0, Lfwc;->f:Lvse;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lfwc;

    const/4 v2, 0x0

    if-eqz v1, :cond_15

    check-cast p1, Lfwc;

    iget-object v1, p0, Lfwc;->d:Late;

    iget-object v3, p1, Lfwc;->d:Late;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    :cond_15
    return v2

    :cond_16
    iget-object v1, p0, Lfwc;->e:Luse;

    iget-object v3, p1, Lfwc;->e:Luse;

    if-eq v1, v3, :cond_1d

    return v2

    :cond_1d
    iget-object p0, p0, Lfwc;->f:Lvse;

    iget-object p1, p1, Lfwc;->f:Lvse;

    if-eq p0, p1, :cond_24

    return v2

    :cond_24
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lfwc;->d:Late;

    invoke-virtual {v0}, Late;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfwc;->e:Luse;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lfwc;->f:Lvse;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
