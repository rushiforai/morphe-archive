.class public final Lvq6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Lcum;

.field public final c:Lwla;

.field public final d:Lola;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcum;Lwla;Lola;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvq6;->a:Ljava/util/List;

    iput-object p2, p0, Lvq6;->b:Lcum;

    iput-object p3, p0, Lvq6;->c:Lwla;

    iput-object p4, p0, Lvq6;->d:Lola;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2a

    instance-of v0, p1, Lvq6;

    if-eqz v0, :cond_28

    check-cast p1, Lvq6;

    iget-object v0, p0, Lvq6;->a:Ljava/util/List;

    iget-object v1, p1, Lvq6;->a:Ljava/util/List;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lvq6;->b:Lcum;

    iget-object v1, p1, Lvq6;->b:Lcum;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lvq6;->c:Lwla;

    iget-object v1, p1, Lvq6;->c:Lwla;

    if-ne v0, v1, :cond_28

    iget-object p0, p0, Lvq6;->d:Lola;

    iget-object p1, p1, Lvq6;->d:Lola;

    if-eq p0, p1, :cond_2a

    :cond_28
    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lvq6;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lvq6;->b:Lcum;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lvq6;->c:Lwla;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit16 v0, v0, 0x3c1

    iget-object p0, p0, Lvq6;->d:Lola;

    if-nez p0, :cond_20

    const/4 p0, 0x0

    goto :goto_24

    :cond_20
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_24
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
